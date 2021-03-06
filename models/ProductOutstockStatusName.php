<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "product_outstock_status_name".
 *
 * @property int $id
 * @property int $product_outstock_status_id
 * @property int $lang_id
 * @property string $name
 *
 * @property Lang $lang
 * @property ProductOutstockStatus $productOutstockStatus
 */
class ProductOutstockStatusName extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product_outstock_status_name';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['product_outstock_status_id', 'lang_id'], 'default', 'value' => null],
            [['product_outstock_status_id', 'lang_id'], 'integer'],
            [['name'], 'string', 'max' => 255],
            [['lang_id'], 'exist', 'skipOnError' => true, 'targetClass' => Lang::className(), 'targetAttribute' => ['lang_id' => 'id']],
            [['product_outstock_status_id'], 'exist', 'skipOnError' => true, 'targetClass' => ProductOutstockStatus::className(), 'targetAttribute' => ['product_outstock_status_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'product_outstock_status_id' => Yii::t('app', 'Product Outstock Status ID'),
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
    public function getProductOutstockStatus()
    {
        return $this->hasOne(ProductOutstockStatus::className(), ['id' => 'product_outstock_status_id']);
    }
}
