<?php

namespace app\modules\admin\models\order;

use Yii;

/**
 * This is the model class for table "order_history".
 *
 * @property int $id
 * @property int $order_id
 * @property string $created_at
 * @property int $previous_status_id
 * @property int $status_id
 * @property bool $is_message
 *
 * @property Order $order
 * @property OrderStatus $previousStatus
 * @property OrderStatus $status
 * @property OrderMessage[] $orderMessages
 */
class OrderHistory extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'order_history';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['order_id', 'previous_status_id', 'status_id'], 'default', 'value' => null],
            [['order_id', 'previous_status_id', 'status_id'], 'integer'],
            [['created_at'], 'safe'],
            [['is_message'], 'boolean'],
            [['order_id'], 'exist', 'skipOnError' => true, 'targetClass' => Order::className(), 'targetAttribute' => ['order_id' => 'id']],
            [['previous_status_id'], 'exist', 'skipOnError' => true, 'targetClass' => OrderStatus::className(), 'targetAttribute' => ['previous_status_id' => 'id']],
            [['status_id'], 'exist', 'skipOnError' => true, 'targetClass' => OrderStatus::className(), 'targetAttribute' => ['status_id' => 'id']],
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
            'created_at' => Yii::t('app', 'Created At'),
            'previous_status_id' => Yii::t('app', 'Previous Status ID'),
            'status_id' => Yii::t('app', 'Status ID'),
            'is_message' => Yii::t('app', 'Is Message'),
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
    public function getPreviousStatus()
    {
        return $this->hasOne(OrderStatus::className(), ['id' => 'previous_status_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getStatus()
    {
        return $this->hasOne(OrderStatus::className(), ['id' => 'status_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrderMessages()
    {
        return $this->hasMany(OrderMessage::className(), ['order_history_id' => 'id']);
    }
}
