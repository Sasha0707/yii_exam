<?php

use yii\helpers\Html;
use yii\grid\GridView;
use yii\widgets\Pjax;

/* @var $this yii\web\View */
/* @var $searchModel backend\modules\rules\models\RulesSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */
/* @var $model common\models\Rules */

$this->title = 'Rules';
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="rules-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php Pjax::begin(); ?>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Rules', ['create'], ['class' => 'btn btn-success']) ?>

    </p>


    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            [
                'attribute' => 'cat_id',
                'value' => function($model){
                    return \common\models\Categories::find()->where(['id' => $model->cat_id])->one()->title;
                }
            ] ,
            [
                'attribute' => 'brand_id',
                'value' => function($model){
                    return \common\models\Brands::find()->where(['id' => $model->brand_id])->one()->title;
                }
            ] ,
            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
    <?php Pjax::end(); ?>
</div>
