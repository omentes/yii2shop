<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "product_to_discount_plan".
 *
 * @property int $id
 * @property int $product_id
 * @property int $discount_plan_id
 *
 * @property DiscountPlan $discountPlan
 * @property Product $product
 */
class ProductToDiscountPlan extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product_to_discount_plan';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['product_id', 'discount_plan_id'], 'default', 'value' => null],
            [['product_id', 'discount_plan_id'], 'integer'],
            [['product_id', 'discount_plan_id'], 'unique', 'targetAttribute' => ['product_id', 'discount_plan_id']],
            [['discount_plan_id'], 'exist', 'skipOnError' => true, 'targetClass' => DiscountPlan::className(), 'targetAttribute' => ['discount_plan_id' => 'id']],
            [['product_id'], 'exist', 'skipOnError' => true, 'targetClass' => Product::className(), 'targetAttribute' => ['product_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'product_id' => Yii::t('app', 'Product ID'),
            'discount_plan_id' => Yii::t('app', 'Discount Plan ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDiscountPlan()
    {
        return $this->hasOne(DiscountPlan::className(), ['id' => 'discount_plan_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProduct()
    {
        return $this->hasOne(Product::className(), ['id' => 'product_id']);
    }
}
