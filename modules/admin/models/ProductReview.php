<?php

namespace app\modules\admin\models;

use Yii;

/**
 * This is the model class for table "product_review".
 *
 * @property int $id
 * @property int $product_id
 * @property string $reviewer_name
 * @property string $content
 * @property int $rating
 *
 * @property Product $product
 */
class ProductReview extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product_review';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['product_id', 'rating'], 'default', 'value' => null],
            [['product_id', 'rating'], 'integer'],
            [['content'], 'string'],
            [['reviewer_name'], 'string', 'max' => 255],
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
            'product_id' => Yii::t('app', 'Product ID'),
            'reviewer_name' => Yii::t('app', 'Reviewer Name'),
            'content' => Yii::t('app', 'Content'),
            'rating' => Yii::t('app', 'Rating'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProduct()
    {
        return $this->hasOne(Product::className(), ['id' => 'product_id']);
    }
}
