<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "user_type".
 *
 * @property int $id
 *
 * @property User[] $users
 * @property UserTypeName[] $userTypeNames
 */
class UserType extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'user_type';
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
    public function getUsers()
    {
        return $this->hasMany(User::className(), ['type_id' => 'id']);
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getUserTypeNames()
    {
        return $this->hasMany(UserTypeName::className(), ['user_tape_id' => 'id']);
    }
}
