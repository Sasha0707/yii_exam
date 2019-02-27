<?php if (!empty($wishlist)) {
  foreach ($wishlist as $wish) {
    ?>
   <div class="product_heart">

   <form action="<?= \yii\helpers\Url::to(['@web/wishlist/wishlist/add']) ?>" method="get">
   <input checked id="product_<?= $product['id'] ?>" type="checkbox"
    class="checkbox-products"
     name="wishlist" data-id="<?= $product['id'] ?>"
     value="<?= $product['id'] ?>">

     <label for="product_<?= $product['id'] ?>" class="class_checkbox"></label></form>
   </div>
     <?php
      }
    ?>
    <div class="product_heart">
     <form action="<?= \yii\helpers\Url::to(['../common/models/Wishlist/add']) ?>" method="get">
 <input id="product_<?= $product['id'] ?>" type="checkbox" class="checkbox-products" name="wishlist" data-id="<?= $product['id'] ?>" alue="<?= $product['id'] ?>">

<label for="product_<?= $product['id'] ?>" class="class_checkbox"></label>
     </form>
    </div>
    <?php

}