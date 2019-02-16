<?php

namespace app\modules\admin\models;

use Yii;

/**
 * This is the model class for table "lang".
 *
 * @property int $id
 * @property string $name
 *
 * @property BrandName[] $brandNames
 * @property OrderStatusName[] $orderStatusNames
 * @property PaymentName[] $paymentNames
 * @property ProductCategoryName[] $productCategoryNames
 * @property ProductName[] $productNames
 * @property ProductOutstockStatusName[] $productOutstockStatusNames
 * @property ProductStatusName[] $productStatusNames
 * @property ShippingName[] $shippingNames
 * @property ShippingOptionName[] $shippingOptionNames
 * @property TagName[] $tagNames
 * @property UserTypeName[] $userTypeNames
 */
class Lang extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'lang';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBrandNames()
    {
        return $this->hasMany(BrandName::className(), ['lang_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrderStatusNames()
    {
        return $this->hasMany(OrderStatusName::className(), ['lang_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPaymentNames()
    {
        return $this->hasMany(PaymentName::className(), ['lang_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductCategoryNames()
    {
        return $this->hasMany(ProductCategoryName::className(), ['lang_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductNames()
    {
        return $this->hasMany(ProductName::className(), ['lang_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductOutstockStatusNames()
    {
        return $this->hasMany(ProductOutstockStatusName::className(), ['lang_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductStatusNames()
    {
        return $this->hasMany(ProductStatusName::className(), ['lang_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getShippingNames()
    {
        return $this->hasMany(ShippingName::className(), ['lang_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getShippingOptionNames()
    {
        return $this->hasMany(ShippingOptionName::className(), ['lang_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getTagNames()
    {
        return $this->hasMany(TagName::className(), ['lang_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUserTypeNames()
    {
        return $this->hasMany(UserTypeName::className(), ['lang_id' => 'id']);
    }
}
