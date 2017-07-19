<?php

namespace AppBundle\Controller;

use DateTime;
use Doctrine\DBAL\Types\Type;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class ResultController extends Controller
{
    /**
     * @Route("/result", name="results")
     */
    
    public function showAction()
    {
        $em = $this->getDoctrine()->getManager();

        $query = $em->createQuery('SELECT COUNT(r.meeting) as nb, IDENTITY(r.meeting) as id
                                   FROM AppBundle:Result r
                                   GROUP BY r.meeting
                                  ');
        
        $meetinFinished = $query->getResult();
        
        $query2 = $em->createQuery('SELECT r FROM AppBundle:Result r');
        $results = $query2->getResult();
        return $this->render('results.html.twig', 
                array ('results' => $results,
                       'finished' => $meetinFinished));
    }
}