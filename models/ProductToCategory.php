<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "product_to_category".
 *
 * @property int $id
 * @property int $product_id
 * @property int $category_id
 *
 * @property Product $product
 * @property ProductCategory $category
 */
class ProductToCategory extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product_to_category';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['product_id', 'category_id'], 'default', 'value' => null],
            [['product_id', 'category_id'], 'integer'],
            [['product_id', 'category_id'], 'unique', 'targetAttribute' => ['product_id', 'category_id']],
            [['product_id'], 'exist', 'skipOnError' => true, 'targetClass' => Product::className(), 'targetAttribute' => ['product_id' => 'id']],
            [['category_id'], 'exist', 'skipOnError' => true, 'targetClass' => ProductCategory::className(), 'targetAttribute' => ['category_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'product_id' => Yii::t('app', 'Product ID'),
            'category_id' => Yii::t('app', 'Category ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProduct()
    {
        return $this->hasOne(Product::className(), ['id' => 'product_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategory()
    {
        return $this->hasOne(ProductCategory::className(), ['id' => 'category_id']);
    }
}
