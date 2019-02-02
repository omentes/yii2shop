<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "product_price".
 *
 * @property int $id
 * @property int $item_count
 * @property int $product_id
 * @property string $price
 * @property int $currency_id
 *
 * @property Currency $currency
 * @property Product $product
 */
class ProductPrice extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product_price';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['item_count', 'product_id', 'currency_id'], 'default', 'value' => null],
            [['item_count', 'product_id', 'currency_id'], 'integer'],
            [['price'], 'number'],
            [['currency_id'], 'exist', 'skipOnError' => true, 'targetClass' => Currency::className(), 'targetAttribute' => ['currency_id' => 'id']],
            [['product_id'], 'exist', 'skipOnError' => true, 'targetClass' => Product::className(), 'targetAttribute' => ['product_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'item_count' => Yii::t('app', 'Item Count'),
            'product_id' => Yii::t('app', 'Product ID'),
            'price' => Yii::t('app', 'Price'),
            'currency_id' => Yii::t('app', 'Currency ID'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCurrency()
    {
        return $this->hasOne(Currency::className(), ['id' => 'currency_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProduct()
    {
        return $this->hasOne(Product::className(), ['id' => 'product_id']);
    }
}
