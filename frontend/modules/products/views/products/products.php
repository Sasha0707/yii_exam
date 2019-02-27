<?php

use yii\helpers\Url;

$this->title = 'Shop';
$this->params['breadcrumbs'][] = $this->title;
?>

        <div class="container">

            <section class="related-product-area section_gap">
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="filter">
                                <div class="all-categories animated">
                                    <h2 class="animated bounceInLeft">Categories</h2>
                                    <ul class="middle_cat">
                                        <li><a href="<?= \yii\helpers\Url::to(['/products/']) ?>">All</a></li>
                                        <?php

                                        if (!empty($categories)) {
                                            foreach ($categories as $cat) {
                                                ?>
                                                <li>
                                                    <a href="<?= \yii\helpers\Url::to(['/products/' . $cat['slug']]) ?>"><?= $cat['title'] ?></a>
                                                </li>
                                                <?php
                                            }
                                        }
                                        ?>
                                    </ul>
                                </div>
                                <div class="midlle-filter">

                                    <h2 class="animated bounceInRight">Filters</h2>
                                    <hr class="reg_hr">

                                    <h3 class="fil_pr">Price</h3>
                                    <div class="clearfix"></div>
                                    <fieldset class="filter-price">

                                        <div class="price-field">
                                            <input type="range" min="10" max="500" value="10" id="lower">
                                            <input type="range" min="100" max="500" value="500" id="upper">
                                        </div>
                                        <div class="price-wrap">
                                            <span class="price-title">FILTER</span>

                                            <div class="price-container">
                                                <div class="price-wrap-1">

                                                    <label for="one">$</label>
                                                    <input id="one">
                                                </div>
                                                <div class="price-wrap_line">-</div>
                                                <div class="price-wrap-2">
                                                    <label for="two">$</label>
                                                    <input id="two">

                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                    <hr class="reg_hr">
                                </div>

                                <div class="midlle-filter"></div>
                                <div class="midlle-filter"></div>
                            </div>
                            <div class="row">
                                <?php if (!empty($brands)) {
                                    foreach ($brands as $brand) {
                                        ?>
                                        <ul class="brands_ul">
                                            <li>
                                                <?php if (!empty($cat_slug)) {
                                                    ?>

                                                    <a href="<?= \yii\helpers\Url::to(['/products/' . $cat_slug . '/' . $brand['slug']]) ?>">
                                                        <img src="<?= \yii\helpers\Url::to('@web/images/uploads/brands/' . $brand['image']) ?>"
                                                             alt=""></a>

                                                    <?php

                                                } else {
                                                    ?>
                                                    <a href="<?= \yii\helpers\Url::to(['/products/' . $brand['slug']]) ?>"> <img
                                                                src="<?= \yii\helpers\Url::to('@web/images/uploads/brands/' . $brand['image']) ?>"
                                                                alt=""></a>
                                                    <?php
                                                }
                                                $cat_slug = '';
                                                ?>
                                            </li>
                                        </ul>
                                        <?php
                                    }
                                } ?>
                            </div>
                        </div>
                        <div class="col-lg-9">

            <?php

            \yii\widgets\Pjax::begin(['enablePushState' => false,'options' =>['class' => 'row']]);

            if (!empty($products)) {
                foreach ($products as $pr) {
                    ?>
                    <div class="col-lg-3 col-md-6">
                        <div class="single-product">
                            <img class="product-img" src="<?= \yii\helpers\Url::to('@web/images/uploads/products/' . $pr['image']) ?>"
                                 alt="">
                            <div class="product-details">
                                <h6><?= $pr['title'] ?></h6>
                                <div class="price">
                                    <?php
                                    if (!empty($pr['sale_price'])) {

                                        ?>
                                        <h6>Price:<del>  $<?= $pr['price'] ?></del></h6>
                                        <h6 class="l-through">$<?= $pr['sale_price'] ?></h6>
                                        <?php
                                    }else{
                                        ?>
                                        <h6>Price: $<?= $pr['price'] ?></h6>
                                        <?php
                                    }
                                    ?>
                                </div>
                                <div class="prd-bottom">
                                    <a href="" class="social-info">
                                        <span class="ti-bag"></span>
                                        <p class="hover-text">add to bag</p>
                                    </a>
                                    <a href="" class="social-info">
                                        <span class="lnr lnr-heart"></span>
                                        <p class="hover-text">Wishlist</p>
                                    </a>
                                    <a href="<?= Url::to(['/product/'.$pr['slug']])?>" class="social-info">
                                        <span class="lnr lnr-move"></span>
                                        <p class="hover-text">views more</p>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>


                    <?php
                }
            }
            ?>
            <div class="clearfix"></div>
            <?php
            echo \yii\widgets\LinkPager::widget(
                [
                    'pagination' => $pagination,
                ]);

            \yii\widgets\Pjax::end();

            ?>
                        </div>
                    </div>
                </div>
        </div>


    </div>


</div>

