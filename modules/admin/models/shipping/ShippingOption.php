<?php

namespace app\modules\admin\models\shipping;

use Yii;

/**
 * This is the model class for table "shipping_option".
 *
 * @property int $id
 * @property int $shipping_id
 * @property string $shipping_option
 *
 * @property OrderToShippingOption[] $orderToShippingOptions
 * @property Shipping $shipping
 * @property ShippingOptionName[] $shippingOptionNames
 */
class ShippingOption extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'shipping_option';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['shipping_id'], 'default', 'value' => null],
            [['shipping_id'], 'integer'],
            [['shipping_option'], 'string', 'max' => 255],
            [['shipping_id'], 'exist', 'skipOnError' => true, 'targetClass' => Shipping::className(), 'targetAttribute' => ['shipping_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'shipping_id' => Yii::t('app', 'Shipping ID'),
            'shipping_option' => Yii::t('app', 'Shipping Option'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrderToShippingOptions()
    {
        return $this->hasMany(OrderToShippingOption::className(), ['shipping_option_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getShipping()
    {
        return $this->hasOne(Shipping::className(), ['id' => 'shipping_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getShippingOptionNames()
    {
        return $this->hasMany(ShippingOptionName::className(), ['shipping_option_id' => 'id']);
    }
}
