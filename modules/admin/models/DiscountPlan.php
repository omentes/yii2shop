<?php

namespace app\modules\admin\models;

use Yii;

/**
 * This is the model class for table "discount_plan".
 *
 * @property int $id
 * @property string $date_start
 * @property string $date_end
 * @property string $content
 * @property int $discount_type_id
 *
 * @property DiscountType $discountType
 * @property ProductToDiscountPlan[] $productToDiscountPlans
 * @property Product[] $products
 */
class DiscountPlan extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'discount_plan';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['date_start', 'date_end'], 'required'],
            [['date_start', 'date_end'], 'safe'],
            [['content'], 'string'],
            [['discount_type_id'], 'default', 'value' => null],
            [['discount_type_id'], 'integer'],
            [['discount_type_id'], 'exist', 'skipOnError' => true, 'targetClass' => DiscountType::className(), 'targetAttribute' => ['discount_type_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'date_start' => Yii::t('app', 'Date Start'),
            'date_end' => Yii::t('app', 'Date End'),
            'content' => Yii::t('app', 'Content'),
            'discount_type_id' => Yii::t('app', 'Discount Type ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDiscountType()
    {
        return $this->hasOne(DiscountType::className(), ['id' => 'discount_type_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductToDiscountPlans()
    {
        return $this->hasMany(ProductToDiscountPlan::className(), ['discount_plan_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProducts()
    {
        return $this->hasMany(Product::className(), ['id' => 'product_id'])->viaTable('product_to_discount_plan', ['discount_plan_id' => 'id']);
    }
}
