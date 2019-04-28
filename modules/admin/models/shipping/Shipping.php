<?php

namespace app\modules\admin\models\shipping;

use Yii;

/**
 * This is the model class for table "shipping".
 *
 * @property int $id
 *
 * @property Order[] $orders
 * @property ShippingName[] $shippingNames
 * @property ShippingOption[] $shippingOptions
 */
class Shipping extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'shipping';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrders()
    {
        return $this->hasMany(Order::className(), ['shipping_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getShippingNames()
    {
        return $this->hasMany(ShippingName::className(), ['shipping_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getShippingOptions()
    {
        return $this->hasMany(ShippingOption::className(), ['shipping_id' => 'id']);
    }
}
