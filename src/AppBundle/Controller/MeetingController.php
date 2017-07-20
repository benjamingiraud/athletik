<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Inscription;
use AppBundle\Entity\Meeting;
use AppBundle\Form\MeetingType;
use DateTime;
use Doctrine\DBAL\Types\Type;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\Request;

class MeetingController extends Controller
{
    /**
     * @Route("/meetings", name="meetings")
     */
    
    public function showAction(Request $request)
    {
        $em = $this->getDoctrine()->getManager();

        $query = $em->createQuery('SELECT m
                                   FROM AppBundle:Meeting m
                                   WHERE m.date > :now
                                   ORDER BY m.date ASC
                                  ')->setParameter("now", new DateTime("NOW"), Type::DATETIME);
        $query2 = $em->createQuery('SELECT i
                                   FROM AppBundle:Inscription i
                                  ');
        
        $meetings     = $query->getResult();
        $inscriptions = $query2->getResult();
        return $this->render('meetings.html.twig', array(
                'events'       => $meetings,
                'inscriptions' => $inscriptions
        ));
    }
    /**
     * @Route("/meetings/add", name="new_meeting")
     */
    
    public function newAction(Request $request)
    {
        $meeting = new Meeting();
        $form = $this->createForm(MeetingType::class, $meeting);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // $file stores the uploaded  file
            /** @var UploadedFile $file */
            $file = $meeting->getImg();

            // Generate a unique name for the file before saving it
            $fileName = md5(uniqid()).'.'.$file->guessExtension();

            // Move the file to the directory where images are stored
            $file->move(
                $this->getParameter('images_directory'),
                $fileName
            );

            // Update the 'image' property to store the file name
            // instead of its contents
            $meeting->setImg($fileName);

            $em = $this->getDoctrine()->getManager();
            $em->persist($meeting);
            $em->flush();

            return $this->redirectToRoute('meetings');
        }

        return $this->render('new_meeting.html.twig', array(
            'form' => $form->createView(),
        ));
    }
    /**
     * @Route("/meetings/inscription/{meeting_id}", name="inscription_meeting")
     */
    public function InscriptionAction(Request $request, $meeting_id) {
        
        $em = $this->getDoctrine()->getManager();
        $query_meeting = $em->createQuery('SELECT m
                                   FROM AppBundle:Meeting m
                                   WHERE m.id = :request_id
                                  ')->setParameter("request_id", $meeting_id);
        
        $meetings = $query_meeting->getResult();
        
        $inscription = new Inscription();
        $inscription->setUser($this->getUser());
        $inscription->setMeeting($meetings[0]);
        
        $em->persist($inscription);
        $em->flush();
        
        return $this->redirectToRoute('meetings');
    }
}