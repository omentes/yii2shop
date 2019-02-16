<?php

namespace app\modules\admin\models;

use Yii;

/**
 * This is the model class for table "product_status".
 *
 * @property int $id
 *
 * @property Product[] $products
 * @property ProductStatusName[] $productStatusNames
 */
class ProductStatus extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product_status';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProducts()
    {
        return $this->hasMany(Product::className(), ['product_status_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductStatusNames()
    {
        return $this->hasMany(ProductStatusName::className(), ['product_status_id' => 'id']);
    }
}
