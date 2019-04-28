<?php

namespace app\modules\admin\models\order;

use Yii;

/**
 * This is the model class for table "order_status_name".
 *
 * @property int $id
 * @property int $order_status_id
 * @property string $name
 * @property int $lang_id
 * @property string $content
 *
 * @property Lang $lang
 * @property OrderStatus $orderStatus
 */
class OrderStatusName extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'order_status_name';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['order_status_id', 'lang_id'], 'default', 'value' => null],
            [['order_status_id', 'lang_id'], 'integer'],
            [['content'], 'string'],
            [['name'], 'string', 'max' => 255],
            [['lang_id'], 'exist', 'skipOnError' => true, 'targetClass' => Lang::className(), 'targetAttribute' => ['lang_id' => 'id']],
            [['order_status_id'], 'exist', 'skipOnError' => true, 'targetClass' => OrderStatus::className(), 'targetAttribute' => ['order_status_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'order_status_id' => Yii::t('app', 'Order Status ID'),
            'name' => Yii::t('app', 'Name'),
            'lang_id' => Yii::t('app', 'Lang ID'),
            'content' => Yii::t('app', 'Content'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLang()
    {
        return $this->hasOne(Lang::className(), ['id' => 'lang_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrderStatus()
    {
        return $this->hasOne(OrderStatus::className(), ['id' => 'order_status_id']);
    }
}
