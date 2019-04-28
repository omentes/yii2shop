<?php

namespace app\modules\admin\models\shipping;

use Yii;

/**
 * This is the model class for table "shipping_name".
 *
 * @property int $id
 * @property int $shipping_id
 * @property int $lang_id
 * @property string $name
 *
 * @property Lang $lang
 * @property Shipping $shipping
 */
class ShippingName extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'shipping_name';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['shipping_id', 'lang_id'], 'default', 'value' => null],
            [['shipping_id', 'lang_id'], 'integer'],
            [['name'], 'string', 'max' => 255],
            [['lang_id'], 'exist', 'skipOnError' => true, 'targetClass' => Lang::className(), 'targetAttribute' => ['lang_id' => 'id']],
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
            'lang_id' => Yii::t('app', 'Lang ID'),
            'name' => Yii::t('app', 'Name'),
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
    public function getShipping()
    {
        return $this->hasOne(Shipping::className(), ['id' => 'shipping_id']);
    }
}
