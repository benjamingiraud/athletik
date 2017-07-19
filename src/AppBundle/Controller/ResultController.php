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
        
        $query_meetings = $em->createQuery('SELECT m
                                            FROM AppBundle:Meeting m
                                            WHERE m.date < :now
                                           ')->setParameter("now", new DateTime("NOW"), Type::DATETIME);
        $finished_meetings = $query_meetings->getResult();
        
        $query_results = $em->createQuery('SELECT r FROM AppBundle:Result r ORDER by r.points DESC');
        $results_meetings = $query_results->getResult();
        
        return $this->render('results.html.twig', 
              array ('finished_meetings' => $finished_meetings,
                     'results_meetings'  => $results_meetings
                    ));
//                       
//        $query = $em->createQuery('SELECT COUNT(r.meeting) as nb, IDENTITY(r.meeting) as id
//                                   FROM AppBundle:Result r
//                                   GROUP BY r.meeting
//                                  ');
//        
//        $meetinFinished = $query->getResult();
//        
//        $query2 = $em->createQuery('SELECT r FROM AppBundle:Result r');
//        $results = $query2->getResult();
//        return $this->render('results.html.twig', 
//                array ('results' => $results,
//                       'finished' => $meetinFinished));
    }
}