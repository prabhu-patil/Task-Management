package TaskManagement.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import TaskManagement.entity.Userss;

@Repository
public interface UserRepository extends JpaRepository<Userss, Integer> {

	Userss findByEmail(String email);
}
