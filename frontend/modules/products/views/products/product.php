
<!--================Single Product Area =================-->
<div class="product_image_area">
    <div class="container">
        <div class="row s_product_inner">
            <div class="col-lg-6">
                <div class="s_Product_carousel">
                    <div class="single-prd-item">
                        <img class="img-fluid" src="<?= \yii\helpers\Url::to('@web/images/uploads/products/'  .  $product['image'] ) ?>" alt="">
                    </div>
                </div>
            </div>
            <div class="col-lg-5 offset-lg-1">
                <div class="s_product_text">
                    <h3><?= $product['title'] ?></h3>
                    <h2><?= $product['price'] ?></h2>
                    <p><?= $product['content'] ?></p>
                    <div class="product_count">
                        <label for="qty">Available Stock:</label>
                        <span><?= $product['available_stock'];?></span>
                    </div>

                    <div class="card_area d-flex align-items-center">
                        <form action="<?= \yii\helpers\Url::to(['/products/products/add-to-cart'])?>">
                        <div class="product_count">
                            <label for="qty">Quantity:</label>
                            <input type="number" value="1" name="qty">
                        </div>
                        <input class="primary-btn" type="submit" value="Add to Cart">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--================End Single Product Area =================-->



