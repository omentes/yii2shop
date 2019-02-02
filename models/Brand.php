<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "brand".
 *
 * @property int $id
 * @property string $image
 * @property string $canonical
 *
 * @property BrandName[] $brandNames
 * @property Product[] $products
 */
class Brand extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'brand';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['image', 'canonical'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'image' => Yii::t('app', 'Image'),
            'canonical' => Yii::t('app', 'Canonical'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBrandNames()
    {
        return $this->hasMany(BrandName::className(), ['brand_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProducts()
    {
        return $this->hasMany(Product::className(), ['brand_id' => 'id']);
    }
}
