<?php

namespace AppBundle\Controller;

use DateTime;
use Doctrine\DBAL\Types\Type;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class IndexController extends Controller
{
    /**
     * @Route("/", name="index")
     */
    
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $query = $em->createQuery('SELECT m
                                   FROM AppBundle:Meeting m
                                   WHERE m.date > :now
                                  ')->setParameter("now", new DateTime("NOW"), Type::DATETIME);
        
        $meetings = $query->getResult();
        return $this->render('index.html.twig', array ('meetings' => $meetings));
    }
}
