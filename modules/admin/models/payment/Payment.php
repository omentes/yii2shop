<?php

namespace app\modules\admin\models\payment;

use app\modules\admin\models\order\Order;
use Yii;

/**
 * This is the model class for table "payment".
 *
 * @property int $id
 *
 * @property Order[] $orders
 * @property PaymentName[] $paymentNames
 */
class Payment extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'payment';
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
        return $this->hasMany(Order::className(), ['payment_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getPaymentNames()
    {
        return $this->hasMany(PaymentName::className(), ['payment_id' => 'id']);
    }
}
