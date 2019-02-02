<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\Product */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="product-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'brand_id')->textInput() ?>

    <?= $form->field($model, 'canonical')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'image_src')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'harvest')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'genetics')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'height')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'bloom_start')->textInput() ?>

    <?= $form->field($model, 'bloom_end')->textInput() ?>

    <?= $form->field($model, 'created_at')->textInput() ?>

    <?= $form->field($model, 'product_status_id')->textInput() ?>

    <?= $form->field($model, 'quantity')->textInput() ?>

    <?= $form->field($model, 'sku')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'vendor_code')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'outstock_status_id')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton(Yii::t('app', 'Save'), ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
