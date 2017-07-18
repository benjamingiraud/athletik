<?php

namespace AppBundle\Controller;

use DateTime;
use Doctrine\DBAL\Types\Type;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class MeetingController extends Controller
{
    /**
     * @Route("/meetings", name="meetings")
     */
    
    public function showAction()
    {
        $em = $this->getDoctrine()->getManager();

        $query = $em->createQuery('SELECT m
                                   FROM AppBundle:Meeting m
                                   WHERE m.date > :now
                                   ORDER BY m.date ASC
                                  ')->setParameter("now", new DateTime("NOW"), Type::DATETIME);
        
        $meetings = $query->getResult();
        return $this->render('meetings.html.twig', array ('events' => $meetings));
    }
}