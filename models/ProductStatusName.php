<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "product_status_name".
 *
 * @property int $id
 * @property int $product_status_id
 * @property int $lang_id
 * @property string $name
 *
 * @property Lang $lang
 * @property ProductStatus $productStatus
 */
class ProductStatusName extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product_status_name';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['product_status_id', 'lang_id'], 'default', 'value' => null],
            [['product_status_id', 'lang_id'], 'integer'],
            [['name'], 'string', 'max' => 255],
            [['lang_id'], 'exist', 'skipOnError' => true, 'targetClass' => Lang::className(), 'targetAttribute' => ['lang_id' => 'id']],
            [['product_status_id'], 'exist', 'skipOnError' => true, 'targetClass' => ProductStatus::className(), 'targetAttribute' => ['product_status_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'product_status_id' => Yii::t('app', 'Product Status ID'),
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
    public function getProductStatus()
    {
        return $this->hasOne(ProductStatus::className(), ['id' => 'product_status_id']);
    }
}
