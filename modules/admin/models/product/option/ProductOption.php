<?php

namespace app\modules\admin\models\product\option;

use app\modules\admin\models\product\ProductToOption;
use Yii;

/**
 * This is the model class for table "product_option".
 *
 * @property int $id
 * @property int $option_group_id
 * @property string $value
 *
 * @property ProductOptionGroup $optionGroup
 * @property ProductOptionGroup $optionGroup0
 * @property ProductOptionName[] $productOptionNames
 * @property ProductToOption[] $productToOptions
 */
class ProductOption extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product_option';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['option_group_id'], 'default', 'value' => null],
            [['option_group_id'], 'integer'],
            [['value'], 'required'],
            [['value'], 'string', 'max' => 255],
            [['option_group_id'], 'exist', 'skipOnError' => true, 'targetClass' => ProductOptionGroup::className(), 'targetAttribute' => ['option_group_id' => 'id']],
            [['option_group_id'], 'exist', 'skipOnError' => true, 'targetClass' => ProductOptionGroup::className(), 'targetAttribute' => ['option_group_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'option_group_id' => Yii::t('app', 'Option Group ID'),
            'value' => Yii::t('app', 'Value'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOptionGroup()
    {
        return $this->hasOne(ProductOptionGroup::className(), ['id' => 'option_group_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOptionGroup0()
    {
        return $this->hasOne(ProductOptionGroup::className(), ['id' => 'option_group_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductOptionNames()
    {
        return $this->hasMany(ProductOptionName::className(), ['option_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getProductToOptions()
    {
        return $this->hasMany(ProductToOption::className(), ['option_id' => 'id']);
    }
}
