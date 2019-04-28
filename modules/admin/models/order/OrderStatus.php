<?php

namespace app\modules\admin\models\order;

use Yii;

/**
 * This is the model class for table "order_status".
 *
 * @property int $id
 *
 * @property Order[] $orders
 * @property OrderHistory[] $orderHistories
 * @property OrderHistory[] $orderHistories0
 * @property OrderStatusName[] $orderStatusNames
 */
class OrderStatus extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'order_status';
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
        return $this->hasMany(Order::className(), ['order_status_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrderHistories()
    {
        return $this->hasMany(OrderHistory::className(), ['previous_status_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrderHistories0()
    {
        return $this->hasMany(OrderHistory::className(), ['status_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrderStatusNames()
    {
        return $this->hasMany(OrderStatusName::className(), ['order_status_id' => 'id']);
    }
}
