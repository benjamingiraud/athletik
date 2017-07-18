<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Result
 *
 * @ORM\Table(name="result", indexes={@ORM\Index(name="athlete_id", columns={"athlete_id"}), @ORM\Index(name="meeting_id", columns={"meeting_id"})})
 * @ORM\Entity
 */
class Result
{
    /**
     * @var float
     *
     * @ORM\Column(name="time", type="float", precision=10, scale=0, nullable=false)
     */
    private $time;

    /**
     * @var integer
     *
     * @ORM\Column(name="points", type="integer", nullable=false)
     */
    private $points;

    /**
     * @var integer
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="IDENTITY")
     */
    private $id;

    /**
     * @var \AppBundle\Entity\Athlete
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Athlete")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="athlete_id", referencedColumnName="id")
     * })
     */
    private $athlete;

    /**
     * @var \AppBundle\Entity\Meeting
     *
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Meeting")
     * @ORM\JoinColumns({
     *   @ORM\JoinColumn(name="meeting_id", referencedColumnName="id")
     * })
     */
    private $meeting;



    /**
     * Set time
     *
     * @param float $time
     *
     * @return Result
     */
    public function setTime($time)
    {
        $this->time = $time;

        return $this;
    }

    /**
     * Get time
     *
     * @return float
     */
    public function getTime()
    {
        return $this->time;
    }

    /**
     * Set points
     *
     * @param integer $points
     *
     * @return Result
     */
    public function setPoints($points)
    {
        $this->points = $points;

        return $this;
    }

    /**
     * Get points
     *
     * @return integer
     */
    public function getPoints()
    {
        return $this->points;
    }

    /**
     * Get id
     *
     * @return integer
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set athlete
     *
     * @param \AppBundle\Entity\Athlete $athlete
     *
     * @return Result
     */
    public function setAthlete(\AppBundle\Entity\Athlete $athlete = null)
    {
        $this->athlete = $athlete;

        return $this;
    }

    /**
     * Get athlete
     *
     * @return \AppBundle\Entity\Athlete
     */
    public function getAthlete()
    {
        return $this->athlete;
    }

    /**
     * Set meeting
     *
     * @param \AppBundle\Entity\Meeting $meeting
     *
     * @return Result
     */
    public function setMeeting(\AppBundle\Entity\Meeting $meeting = null)
    {
        $this->meeting = $meeting;

        return $this;
    }

    /**
     * Get meeting
     *
     * @return \AppBundle\Entity\Meeting
     */
    public function getMeeting()
    {
        return $this->meeting;
    }
}
