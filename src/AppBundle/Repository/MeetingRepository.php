<?php

namespace AppBundle\Repository;

use DateTime;
use Doctrine\DBAL\Types\Type;
use Doctrine\ORM\EntityRepository;

class MeetingRepository extends EntityRepository {
    
    public function findFuture() {
        
        return $this->getEntityManager()
                ->createQuery(
                       'SELECT m
                        FROM AppBundle:Meeting m
                        WHERE m.date > :now
                        ORDER BY m.date ASC'
                )
                ->setParameter("now", new DateTime("NOW"), Type::DATETIME)
                ->getResult();
    }
    public function findPassed() {
        
        return $this->getEntityManager()
                ->createQuery(
                       'SELECT m
                        FROM AppBundle:Meeting m
                        WHERE m.date < :now
                        ORDER BY m.date ASC'
                )
                ->setParameter("now", new DateTime("NOW"), Type::DATETIME)
                ->getResult();
    }
}
