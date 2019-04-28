<?php

namespace app\modules\admin\models\product\option;

use Yii;

/**
 * This is the model class for table "product_option_name".
 *
 * @property int $id
 * @property int $lang_id
 * @property int $option_id
 * @property string $content
 *
 * @property Lang $lang
 * @property ProductOption $option
 */
class ProductOptionName extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'product_option_name';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['lang_id', 'option_id', 'content'], 'required'],
            [['lang_id', 'option_id'], 'default', 'value' => null],
            [['lang_id', 'option_id'], 'integer'],
            [['content'], 'string'],
            [['lang_id'], 'exist', 'skipOnError' => true, 'targetClass' => Lang::className(), 'targetAttribute' => ['lang_id' => 'id']],
            [['option_id'], 'exist', 'skipOnError' => true, 'targetClass' => ProductOption::className(), 'targetAttribute' => ['option_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'lang_id' => Yii::t('app', 'Lang ID'),
            'option_id' => Yii::t('app', 'Option ID'),
            'content' => Yii::t('app', 'Content'),
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getLang()
    {
        return $this->hasOne(Lang::className(), ['id' => 'lang_id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getOption()
    {
        return $this->hasOne(ProductOption::className(), ['id' => 'option_id']);
    }
}
