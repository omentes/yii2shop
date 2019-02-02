<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\ProductSearch */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="product-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
        'options' => [
            'data-pjax' => 1
        ],
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'brand_id') ?>

    <?= $form->field($model, 'canonical') ?>

    <?= $form->field($model, 'image_src') ?>

    <?= $form->field($model, 'harvest') ?>

    <?php // echo $form->field($model, 'genetics') ?>

    <?php // echo $form->field($model, 'height') ?>

    <?php // echo $form->field($model, 'bloom_start') ?>

    <?php // echo $form->field($model, 'bloom_end') ?>

    <?php // echo $form->field($model, 'created_at') ?>

    <?php // echo $form->field($model, 'product_status_id') ?>

    <?php // echo $form->field($model, 'quantity') ?>

    <?php // echo $form->field($model, 'sku') ?>

    <?php // echo $form->field($model, 'vendor_code') ?>

    <?php // echo $form->field($model, 'outstock_status_id') ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Search'), ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton(Yii::t('app', 'Reset'), ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
