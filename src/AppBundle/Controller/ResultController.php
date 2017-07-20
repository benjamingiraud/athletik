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
        // Native query for general classment
        $sql = "SELECT SUM(result.points) as total, SUM(result.time) as ttime, user.lastname, user.firstname, category.name "
                . "FROM result "
                . "inner join user on result.user_id = user.id "
                . "inner join meeting on result.meeting_id = meeting.id "
                . "inner join category on user.category = category.id "
                . "WHERE YEAR(CURRENT_DATE()) = 2017 "
                . "GROUP BY user.id "
                . "ORDER BY total DESC ";
        $nativeQuery = $em->getConnection()->prepare($sql);
        $nativeQuery->execute();
        $general_classment = $nativeQuery->fetchAll();

        $query_meetings = $em->createQuery('SELECT m
                                            FROM AppBundle:Meeting m
                                            WHERE m.date < :now
                                           ')->setParameter("now", new DateTime("NOW"), Type::DATETIME);
        $finished_meetings = $query_meetings->getResult();
        
        $query_results = $em->createQuery('SELECT r FROM AppBundle:Result r ORDER by r.points DESC');
        $results_meetings = $query_results->getResult();
        
        $query_inscription = $em->createQuery('SELECT i
                                   FROM AppBundle:Inscription i
                                  ');
        
        $inscriptions = $query_inscription->getResult();
        
        return $this->render('results.html.twig', 
              array ('finished_meetings' => $finished_meetings,
                     'results_meetings'  => $results_meetings,
                     'generals'          => $general_classment,
                     'inscriptions'       => $inscriptions
                    ));
//        return $this->render('results.html.twig', 
//              array ('individuals'       => $individual_classment,
//                     'generals'          => $general_classment
//                    ));
    }
}