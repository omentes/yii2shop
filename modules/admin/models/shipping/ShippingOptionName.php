<?php

namespace app\modules\admin\models\shipping;

use Yii;

/**
 * This is the model class for table "shipping_option_name".
 *
 * @property int $id
 * @property int $shipping_option_id
 * @property int $lang_id
 * @property string $name
 *
 * @property Lang $lang
 * @property ShippingOption $shippingOption
 */
class ShippingOptionName extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'shipping_option_name';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['shipping_option_id', 'lang_id'], 'default', 'value' => null],
            [['shipping_option_id', 'lang_id'], 'integer'],
            [['name'], 'string', 'max' => 255],
            [['lang_id'], 'exist', 'skipOnError' => true, 'targetClass' => Lang::className(), 'targetAttribute' => ['lang_id' => 'id']],
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
            'shipping_option_id' => Yii::t('app', 'Shipping Option ID'),
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
    public function getShippingOption()
    {
        return $this->hasOne(ShippingOption::className(), ['id' => 'shipping_option_id']);
    }
}
