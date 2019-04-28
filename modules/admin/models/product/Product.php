<?php

namespace app\modules\admin\models\product;

use app\modules\admin\models\discount\DiscountPlan;
use app\modules\admin\models\order\OrderToProduct;
use app\modules\admin\models\product\brand\ProductBrand;
use app\modules\admin\models\product\category\ProductCategory;
use app\modules\admin\models\product\status\ProductOutstockStatus;
use app\modules\admin\models\product\status\ProductStatus;
use Yii;

/**
 * This is the model class for table "product".
 *
 * @property int $id
 * @property int $brand_id
 * @property string $image_src
 * @property string $created_at
 * @property int $product_status_id
 * @property int $quantity
 * @property string $sku
 * @property string $vendor_code
 * @property int $outstock_status_id
 *
 * @property OrderToProduct[] $orderToProducts
 * @property ProductBrand $brand
 * @property ProductOutstockStatus $outstockStatus
 * @property ProductStatus $productStatus
 * @property ProductName[] $productNames
 * @property ProductPrice[] $productPrices
 * @property ProductReview[] $productReviews
 * @property ProductToCategory[] $productToCategories
 * @property ProductCategory[] $categories
 * @property ProductToDiscountPlan[] $productToDiscountPlans
 * @property DiscountPlan[] $discountPlans
 * @property ProductToOption[] $productToOptions
 * @property ProductToPromocode[] $productToPromocodes
 * @property ProductToTag[] $productToTags
 */
class Product extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['brand_id', 'product_status_id', 'quantity', 'outstock_status_id'], 'default', 'value' => null],
            [['brand_id', 'product_status_id', 'quantity', 'outstock_status_id'], 'integer'],
            [['created_at'], 'safe'],
            [['image_src', 'sku', 'vendor_code'], 'string', 'max' => 255],
            [['brand_id'], 'exist', 'skipOnError' => true, 'targetClass' => ProductBrand::className(), 'targetAttribute' => ['brand_id' => 'id']],
            [['outstock_status_id'], 'exist', 'skipOnError' => true, 'targetClass' => ProductOutstockStatus::className(), 'targetAttribute' => ['outstock_status_id' => 'id']],
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
            'brand_id' => Yii::t('app', 'Brand ID'),
            'image_src' => Yii::t('app', 'Image Src'),
            'created_at' => Yii::t('app', 'Created At'),
            'product_status_id' => Yii::t('app', 'Product Status ID'),
            'quantity' => Yii::t('app', 'Quantity'),
            'sku' => Yii::t('app', 'Sku'),
            'vendor_code' => Yii::t('app', 'Vendor Code'),
            'outstock_status_id' => Yii::t('app', 'Outstock Status ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOrderToProducts()
    {
        return $this->hasMany(OrderToProduct::className(), ['product_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getBrand()
    {
        return $this->hasOne(ProductBrand::className(), ['id' => 'brand_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOutstockStatus()
    {
        return $this->hasOne(ProductOutstockStatus::className(), ['id' => 'outstock_status_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductStatus()
    {
        return $this->hasOne(ProductStatus::className(), ['id' => 'product_status_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductNames()
    {
        return $this->hasMany(ProductName::className(), ['product_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductPrices()
    {
        return $this->hasMany(ProductPrice::className(), ['product_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductReviews()
    {
        return $this->hasMany(ProductReview::className(), ['product_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductToCategories()
    {
        return $this->hasMany(ProductToCategory::className(), ['product_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCategories()
    {
        return $this->hasMany(ProductCategory::className(), ['id' => 'category_id'])->viaTable('product_to_category', ['product_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductToDiscountPlans()
    {
        return $this->hasMany(ProductToDiscountPlan::className(), ['product_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDiscountPlans()
    {
        return $this->hasMany(DiscountPlan::className(), ['id' => 'discount_plan_id'])->viaTable('product_to_discount_plan', ['product_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductToOptions()
    {
        return $this->hasMany(ProductToOption::className(), ['product_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductToPromocodes()
    {
        return $this->hasMany(ProductToPromocode::className(), ['product_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductToTags()
    {
        return $this->hasMany(ProductToTag::className(), ['product_id' => 'id']);
    }
}
