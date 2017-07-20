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
        $sql = "SELECT SUM(result.points) as total, SUM(result.time) as ttime, athlete.lastname, athlete.firstname, category.name "
                . "FROM result "
                . "inner join athlete on result.athlete_id = athlete.id "
                . "inner join meeting on result.meeting_id = meeting.id "
                . "inner join category on athlete.category = category.id "
                . "WHERE YEAR(CURRENT_DATE()) = 2017 "
                . "GROUP BY athlete.id "
                . "ORDER BY total DESC ";
        $nativeQuery = $em->getConnection()->prepare($sql);
        $nativeQuery->execute();
        $general_classment = $nativeQuery->fetchAll();
//        $query_general  = $em->createQuery('SELECT SUM(r.points) as total
//                                            FROM AppBundle:Result r,
//                                            GROUP BY r.ahlete
//                                            ORDER BY total DESC');
//        $general_classment = $query_general->getResult();
        
        $query_meetings = $em->createQuery('SELECT m
                                            FROM AppBundle:Meeting m
                                            WHERE m.date < :now
                                           ')->setParameter("now", new DateTime("NOW"), Type::DATETIME);
        $finished_meetings = $query_meetings->getResult();
        
        $query_results = $em->createQuery('SELECT r FROM AppBundle:Result r ORDER by r.points DESC');
        $results_meetings = $query_results->getResult();
        
        return $this->render('results.html.twig', 
              array ('finished_meetings' => $finished_meetings,
                     'results_meetings'  => $results_meetings,
                     'generals'          => $general_classment
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