use videoclub;
DELIMITER //
DROP PROCEDURE IF EXISTS Procedure//
CREATE PROCEDURE Procedure()
begin
   declare cactor bigint default 0;
   declare final int default false;

   declare cursor cursor for
      select id_actor
      from ACTORS;

   declare continue handler for not found set final = 1;
   open cursor;
   bucle:loop
      fetch cursor into cactor;

      if final = 1 then
         leave bucle;
      end if;
      SELECT nom_actor, year(curdate()) - anynaix_actor"anys", anynaix_actor, sexe_actor,
      /*condicio home*/
      if(sexe_actor="home",
      if(year(curdate()) - anynaix_actor<15,"nen",
      if(year(curdate()) - anynaix_actor BETWEEN 15 AND 25,"home adolescent i jove",
      if(year(curdate()) - anynaix_actor BETWEEN 26 AND 40, "home adult",
      if(year(curdate()) - anynaix_actor BETWEEN 41 AND 60, "home madur",
      if(year(curdate()) - anynaix_actor>61, "home gran",""))))),

      /*condicio dona*/
      if(year(curdate()) - anynaix_actor<15,"nena",
      if(year(curdate()) - anynaix_actor BETWEEN 15 AND 25,"dona adolescent i jove",
      if(year(curdate()) - anynaix_actor BETWEEN 26 AND 40, "dona adult",
      if(year(curdate()) - anynaix_actor BETWEEN 41 AND 60, "dona madura",
      if(year(curdate()) - anynaix_actor>61, "dona gran","")))))) as "Paper que pot interpretar"
      FROM ACTORS
      WHERE ACTORS.id_actor = cactor;
   end loop bucle;
   close cursor;
end//

delimiter ;
