<?php

namespace app\models\user;

use Yii;

/**
 * This is the model class for table "user_type_name".
 *
 * @property int $id
 * @property int $user_tape_id
 * @property string $name
 * @property int $lang_id
 * @property string $content
 *
 * @property Lang $lang
 * @property UserType $userTape
 */
class UserTypeName extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'user_type_name';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['user_tape_id', 'lang_id'], 'default', 'value' => null],
            [['user_tape_id', 'lang_id'], 'integer'],
            [['content'], 'string'],
            [['name'], 'string', 'max' => 255],
            [['lang_id'], 'exist', 'skipOnError' => true, 'targetClass' => Lang::className(), 'targetAttribute' => ['lang_id' => 'id']],
            [['user_tape_id'], 'exist', 'skipOnError' => true, 'targetClass' => UserType::className(), 'targetAttribute' => ['user_tape_id' => 'id']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id' => Yii::t('app', 'ID'),
            'user_tape_id' => Yii::t('app', 'User Tape ID'),
            'name' => Yii::t('app', 'Name'),
            'lang_id' => Yii::t('app', 'Lang ID'),
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
    public function getUserTape()
    {
        return $this->hasOne(UserType::className(), ['id' => 'user_tape_id']);
    }
}
