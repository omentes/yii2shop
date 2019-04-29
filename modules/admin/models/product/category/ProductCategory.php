<?php

namespace app\modules\admin\models\product\category;

use app\modules\admin\models\product\Product;
use app\modules\admin\models\product\ProductToCategory;
use Yii;

/**
 * This is the model class for table "product_category".
 *
 * @property int $id
 * @property string $image
 * @property int $sorted
 * @property int $parent_id
 *
 * @property ProductCategoryName[] $productCategoryNames
 * @property ProductToCategory[] $productToCategories
 * @property Product[] $products
 */
class ProductCategory extends \yii\db\ActiveRecord
{
    public $name;
    public $lang;
    public $parent;

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
            [['sorted', 'parent_id'], 'default', 'value' => null],
            [['sorted', 'parent_id'], 'integer'],
            [['name', 'parent'], 'safe'],
            [['image', 'name', 'parent'], 'string', 'max' => 255],
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
            'sorted' => Yii::t('app', 'Sorted'),
            'parent_id' => Yii::t('app', 'Parent ID'),
            'name' => Yii::t('app', 'Name'),
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
