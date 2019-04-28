<?php

namespace app\modules\admin\models\order;

use app\modules\admin\models\shipping\ShippingOption;
use Yii;

/**
 * This is the model class for table "order_to_shipping_option".
 *
 * @property int $id
 * @property int $order_id
 * @property int $shipping_option_id
 * @property string $value
 *
 * @property Order $order
 * @property ShippingOption $shippingOption
 */
class OrderToShippingOption extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'order_to_shipping_option';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['order_id', 'shipping_option_id'], 'default', 'value' => null],
            [['order_id', 'shipping_option_id'], 'integer'],
            [['value'], 'string', 'max' => 255],
            [['order_id'], 'exist', 'skipOnError' => true, 'targetClass' => Order::className(), 'targetAttribute' => ['order_id' => 'id']],
            [['shipping_option_id'], 'exist', 'skipOnError' => true, 'targetClass' => ShippingOption::className(), 'targetAttribute' => ['shipping_option_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'order_id' => Yii::t('app', 'Order ID'),
            'shipping_option_id' => Yii::t('app', 'Shipping Option ID'),
            'value' => Yii::t('app', 'Value'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrder()
    {
        return $this->hasOne(Order::className(), ['id' => 'order_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getShippingOption()
    {
        return $this->hasOne(ShippingOption::className(), ['id' => 'shipping_option_id']);
    }
}
