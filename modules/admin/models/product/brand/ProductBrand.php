<?php

namespace app\modules\admin\models\product\brand;

use Yii;

/**
 * This is the model class for table "product_brand".
 *
 * @property int $id
 * @property string $image
 *
 * @property Product[] $products
 * @property ProductBrandName[] $productBrandNames
 */
class ProductBrand extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product_brand';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['image'], 'string', 'max' => 255],
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
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProducts()
    {
        return $this->hasMany(Product::className(), ['brand_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductBrandNames()
    {
        return $this->hasMany(ProductBrandName::className(), ['brand_id' => 'id']);
    }
}
