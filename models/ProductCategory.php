<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "product_category".
 *
 * @property int $id
 * @property string $image
 * @property string $canonical
 * @property int $sorted
 *
 * @property ProductCategoryName[] $productCategoryNames
 * @property ProductCategoryTree[] $productCategoryTrees
 * @property ProductCategoryTree[] $productCategoryTrees0
 * @property ProductToCategory[] $productToCategories
 * @property Product[] $products
 */
class ProductCategory extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product_category';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['sorted'], 'default', 'value' => null],
            [['sorted'], 'integer'],
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
            'sorted' => Yii::t('app', 'Sorted'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductCategoryNames()
    {
        return $this->hasMany(ProductCategoryName::className(), ['product_category_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductCategoryTrees()
    {
        return $this->hasMany(ProductCategoryTree::className(), ['child_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductCategoryTrees0()
    {
        return $this->hasMany(ProductCategoryTree::className(), ['parent_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductToCategories()
    {
        return $this->hasMany(ProductToCategory::className(), ['category_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProducts()
    {
        return $this->hasMany(Product::className(), ['id' => 'product_id'])->viaTable('product_to_category', ['category_id' => 'id']);
    }
}
