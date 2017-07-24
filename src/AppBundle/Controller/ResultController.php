<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Meeting;
use AppBundle\Entity\Result;
use AppBundle\Entity\User;
use DateTime;
use Doctrine\DBAL\Types\Type;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class ResultController extends Controller
{
    /**
     * @Route("/result", name="results")
     */
    
    public function showAction(Request $request)
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
                                            WHERE m.date < :now'
                                          )->setParameter("now", new DateTime("NOW"), Type::DATETIME);
        $finished_meetings = $query_meetings->getResult();
        
        $query_results = $em->createQuery('SELECT r
                                           FROM AppBundle:Result r 
                                           ORDER BY r.points DESC');
        $results_meetings = $query_results->getResult();
        
        if($request->isXmlHttpRequest())
        {
            $meeting_id = $request->request->get('meeting_id');
            $user_id    = $request->request->get('user_id');
            $time       = $request->request->get('result_time');
            $points     = $request->request->get('result_points');

            $meeting    = $this->getDoctrine()
                    ->getRepository(Meeting::class)
                    ->findOneBy(['id' => $meeting_id]);
            
            $user       = $this->getDoctrine()
                    ->getRepository(User::class)
                    ->findOneBy(['id' => $user_id]);
            
            $result     = $this->getDoctrine()
                    ->getRepository(Result::class)
                    ->findOneBy(['user' => $user, 'meeting' => $meeting]);
            
            // If result already exists, update it
            if ($result) {
                $newresult = $result;
                $newresult->setTime($time);
                $newresult->setPoints($points);
            }
            // Else insert it
            else {
                $newresult = new Result();
                $newresult->setMeeting($meeting);
                $newresult->setUser($user);
                $newresult->setTime($time);
                $newresult->setPoints($points);
            }
            
            $em->persist($newresult);
            $em->flush();
            
            return new Response("Resultat bien ajouté");  
        }
        return $this->render('results.html.twig', array (
            'finished_meetings' => $finished_meetings,
            'results'           => $results_meetings,
            'generals'          => $general_classment,
        ));
    }
}