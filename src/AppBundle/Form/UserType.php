<?php

namespace AppBundle\Form;

use AppBundle\Entity\User;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;



class UserType extends AbstractType
{
    /**
     * {@inheritdoc}
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder->add('username', TextType::class, array (
                    'label' => 'Nom d\'utilisateur : '))
                ->add('password', RepeatedType::class, array(
                    'type'           => PasswordType::class,
                    'first_options'  => array('label' => 'Mot de passe :'),
                    'second_options' => array('label' => 'Répéter votre mot de passe :'),
                    'invalid_message'=> 'Les mots de passe ne correspondent pas'))
                ->add('lastname', TextType::class, array (
                    'label' => 'Nom : '))
                ->add('firstname', TextType::class, array (
                    'label' => 'Prénom : '))
                ->add('category', EntityType::class, array(
                    'class'        => 'AppBundle:Category',
                    'label'        => 'Votre catégorie : ',
                    'choice_label' => 'name'));
    }
    
    /**
     * {@inheritdoc}
     */
    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'AppBundle\Entity\User'
        ));
    }

    /**
     * {@inheritdoc}
     */
    public function getBlockPrefix()
    {
        return 'appbundle_user';
    }


}
