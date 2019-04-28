<?php

namespace app\modules\admin\models\order;

use Yii;

/**
 * This is the model class for table "order".
 *
 * @property int $id
 * @property string $created_at
 * @property int $order_status_id
 * @property int $user_id
 * @property string $amount
 * @property string $description
 * @property int $shipping_id
 * @property int $payment_id
 *
 * @property OrderStatus $orderStatus
 * @property Payment $payment
 * @property Shipping $shipping
 * @property User $user
 * @property OrderHistory[] $orderHistories
 * @property OrderToProduct[] $orderToProducts
 * @property OrderToShippingOption[] $orderToShippingOptions
 */
class Order extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'order';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['created_at'], 'safe'],
            [['order_status_id', 'user_id', 'shipping_id', 'payment_id'], 'default', 'value' => null],
            [['order_status_id', 'user_id', 'shipping_id', 'payment_id'], 'integer'],
            [['amount'], 'number'],
            [['description'], 'string'],
            [['order_status_id'], 'exist', 'skipOnError' => true, 'targetClass' => OrderStatus::className(), 'targetAttribute' => ['order_status_id' => 'id']],
            [['payment_id'], 'exist', 'skipOnError' => true, 'targetClass' => Payment::className(), 'targetAttribute' => ['payment_id' => 'id']],
            [['shipping_id'], 'exist', 'skipOnError' => true, 'targetClass' => Shipping::className(), 'targetAttribute' => ['shipping_id' => 'id']],
            [['user_id'], 'exist', 'skipOnError' => true, 'targetClass' => User::className(), 'targetAttribute' => ['user_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'created_at' => Yii::t('app', 'Created At'),
            'order_status_id' => Yii::t('app', 'Order Status ID'),
            'user_id' => Yii::t('app', 'User ID'),
            'amount' => Yii::t('app', 'Amount'),
            'description' => Yii::t('app', 'Description'),
            'shipping_id' => Yii::t('app', 'Shipping ID'),
            'payment_id' => Yii::t('app', 'Payment ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrderStatus()
    {
        return $this->hasOne(OrderStatus::className(), ['id' => 'order_status_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPayment()
    {
        return $this->hasOne(Payment::className(), ['id' => 'payment_id']);
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
    public function getUser()
    {
        return $this->hasOne(User::className(), ['id' => 'user_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrderHistories()
    {
        return $this->hasMany(OrderHistory::className(), ['order_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrderToProducts()
    {
        return $this->hasMany(OrderToProduct::className(), ['order_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrderToShippingOptions()
    {
        return $this->hasMany(OrderToShippingOption::className(), ['order_id' => 'id']);
    }
}
