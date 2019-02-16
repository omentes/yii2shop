<?php

namespace app\modules\admin\models;

use Yii;

/**
 * This is the model class for table "discount_logic".
 *
 * @property int $id
 * @property string $name
 * @property string $operation
 *
 * @property DiscountType[] $discountTypes
 */
class DiscountLogic extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'discount_logic';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['name', 'operation'], 'string', 'max' => 255],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'name' => Yii::t('app', 'Name'),
            'operation' => Yii::t('app', 'Operation'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getDiscountTypes()
    {
        return $this->hasMany(DiscountType::className(), ['discount_logic_type' => 'id']);
    }
}
