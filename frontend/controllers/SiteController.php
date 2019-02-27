<?php

namespace frontend\controllers;

use common\models\Cart;
use common\models\Wishlist;
use Yii;
use yii\base\InvalidArgumentException;
use yii\web\BadRequestHttpException;
use yii\web\Controller;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use common\models\LoginForm;
use frontend\models\PasswordResetRequestForm;
use frontend\models\ResetPasswordForm;
use frontend\models\SignupForm;
use frontend\models\ContactForm;
use common\models\Categories;
use common\models\Products;
/**
 * Site controller
 */
class SiteController extends Controller
{
    /**
     * {@inheritdoc}
     */
    public function behaviors()
    {
        return [
            'access' => [
                'class' => AccessControl::className(),
                'only' => ['logout', 'signup'],
                'rules' => [
                    [
                        'actions' => ['signup'],
                        'allow' => true,
                        'roles' => ['?'],
                    ],
                    [
                        'actions' => ['logout'],
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'logout' => ['post'],
                ],
            ],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function actions()
    {
        return [
            'error' => [
                'class' => 'yii\web\ErrorAction',
            ],
            'captcha' => [
                'class' => 'yii\captcha\CaptchaAction',
                'fixedVerifyCode' => YII_ENV_TEST ? 'testme' : null,
            ],
        ];
    }

    /**
     * Displays homepage.
     *
     * @return mixed
     */
    public function actionIndex()
    {

        $ForStylish = Products::find()->where(['for_stylish'=>'1'])->orderBy(['id'=>SORT_DESC])->limit(3)->asArray()->all();
        $New = Products::find()->where(['is_new'=>'0'])->orderBy(['id'=>SORT_DESC])->limit(6)->asArray()->all();
        $IsFeature=Products::find()->where(['is_feature'=>'1'])->orderBy(['id'=>SORT_DESC])->limit(6)->asArray()->all();
        $Cat = Categories::find()->orderBy(['id'=>SORT_DESC])->limit(6)->asArray()->all();;
        return $this->render('index',[
            'ForStylish' =>$ForStylish,
            'New' => $New,
            'IsFeature' => $IsFeature,
            'Cat' => $Cat,

        ]);
    }
    public function actionCategory()
    {
        $All =  Products::find()->asArray()->All();
        $ForStylish = Products::find()->where(['for_stylish'=>'1'])->orderBy(['id'=>SORT_DESC])->limit(3)->asArray()->all();
        $New = Products::find()->where(['is_new'=>'0'])->orderBy(['id'=>SORT_DESC])->limit(6)->asArray()->all();
        $IsFeature=Products::find()->where(['is_feature'=>'1'])->orderBy(['id'=>SORT_DESC])->limit(6)->asArray()->all();
        $Cat = Categories::find()->asArray()->all();;
        return $this->render('category',[
            'ForStylish' =>$ForStylish,
            'New' => $New,
            'IsFeature' => $IsFeature,
            'Cat' => $Cat,
            'All' => $All

        ]);
    }
    public function actionBlog()
    {
        return $this->render('blog');
    }
    public function actionCat()
    {
        return $this->render('category');
    }

    public function actionConfirmation()
    {
        return $this->render('confirmation');
    }

    public function actionElements()
    {
        return $this->render('elements');
    }

    public function actionSingle()
    {
        return $this->render('single');
    }
    public function actionWish()
    {
        $wishlist = Wishlist::find()->with('product')->where(['user_id' => Yii::$app->user->id])->asArray()->all();

//        echo "<pre>";
        print_r($wishlist);
        die;
        return $this->render('wishlist',['wishlist' => $wishlist]);
    }

    public function actionSingleProduct()

    {
        $New = Products::find()->asArray()->where(['is_new'=>'0'])->orderBy(['id'=>SORT_DESC])->limit(6)->asArray()->all();

        $id = Yii::$app->request->get('id');
        $product = Products::find()->where(['id' => $id])->asArray()->one();
        return $this->render('single-product',[
            'product' =>$product,
            'New' => $New,
        ]);
    }



    public function actionTracking()
    {
        return $this->render('tracking');
    }

    public function actionCheckout()
    {
        return $this->render('checkout');
    }

    /**
     * Logs in a user.
     *
     * @return mixed
     */
    public function actionLogin()
    {
        if (!Yii::$app->user->isGuest) {
            return $this->goHome();
        }

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        } else {
            $model->password = '';

            return $this->render('login', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Logs out the current user.
     *
     * @return mixed
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();

        return $this->goHome();
    }

    /**
     * Displays contact page.
     *
     * @return mixed
     */
    public function actionContact()
    {
        $model = new ContactForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail(Yii::$app->params['adminEmail'])) {
                Yii::$app->session->setFlash('success', 'Thank you for contacting us. We will respond to you as soon as possible.');
            } else {
                Yii::$app->session->setFlash('error', 'There was an error sending your message.');
            }

            return $this->refresh();
        } else {
            return $this->render('contact', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Displays about page.
     *
     * @return mixed
     */
    public function actionAbout()
    {
        return $this->render('about');
    }

    /**
     * Signs user up.
     *
     * @return mixed
     */
    public function actionSignup()
    {
        $model = new SignupForm();
        if ($model->load(Yii::$app->request->post())) {
            if ($user = $model->signup()) {
                if (Yii::$app->getUser()->login($user)) {
                    return $this->goHome();
                }
            }
        }

        return $this->render('signup', [
            'model' => $model,
        ]);
    }

    /**
     * Requests password reset.
     *
     * @return mixed
     */
    public function actionRequestPasswordReset()
    {
        $model = new PasswordResetRequestForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            if ($model->sendEmail()) {
                Yii::$app->session->setFlash('success', 'Check your email for further instructions.');

                return $this->goHome();
            } else {
                Yii::$app->session->setFlash('error', 'Sorry, we are unable to reset password for the provided email address.');
            }
        }

        return $this->render('requestPasswordResetToken', [
            'model' => $model,
        ]);
    }

    /**
     * Resets password.
     *
     * @param string $token
     * @return mixed
     * @throws BadRequestHttpException
     */
    public function actionResetPassword($token)
    {
        try {
            $model = new ResetPasswordForm($token);
        } catch (InvalidArgumentException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->resetPassword()) {
            Yii::$app->session->setFlash('success', 'New password saved.');

            return $this->goHome();
        }

        return $this->render('resetPassword', [
            'model' => $model,
        ]);
    }
    public function actionCart()
    {
        if(!Yii::$app->user->isGuest){
            $product = Cart::find()->with(['product'])->where(['user_id' => Yii::$app->user->id])->asArray()->all();
            $products = [];
            if(!empty($product)){
                foreach ($product as $item){
                    $products[$item['product_id']]['id'] = $item['id'];
                    $products[$item['product_id']]['product'] = $item['product'];
                    if(empty($products[$item['product_id']]['qty'])){
                        $products[$item['product_id']]['qty'] = 0;
                    }
                    $products[$item['product_id']]['qty'] += (int)$item['quantity'];
                }
            }

            return $this->render('/site/cart',[
                'products' =>$products
            ]);
        }
        return $this->redirect(['/']);

    }
}

