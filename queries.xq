(:query 1:)
<flights>
	{
		for $f in doc("travel.xml")//travel/flight
		where $f/fliesFrom = 'air1' &
		$f/fliesTo = 'air2' &
		$f/date = '11/20/2014'
		return <flight>
					{
						$f/departureTime,
						$f/arrivalTime
					}
				</flight>
	}
</flights>

(:query 2 :)
<passengerSort>
	{
		for $pass in doc("travel.xml")//travel/passenger
		for $res in doc("travel.xml")//travel/reservation
		where $pass/ssnID = $res/pID
		return <passenger>
					{
						$pass/name,
						$pass/address,
						count($res/creditCard)
					}
			   </passenger>	
	}
</passengerSort>

(:query 3:)
<result>
	{
		for $air in doc("travel.xml")//travel/airport
		for $fly in doc("travel.xml")//travel/flight
		where $air/a_id = $fly/fliesFrom & $air/a_id = $fly/fliesTo
		return <airport>
					{
						$air/a_id,
						$sir/name,
						<arrives>{count($fly/fliesTo)}</arrives>
						<departs>{count($fly/fliesFrom)}</departs>
					}
				</airport>
	}
</result>

(:query 5:)
<countRes>
	{
		for $cPas in doc("travel.xml")//travel/passenger
		for $cRes in doc("travel.xml")//travel/reservation
		where $cPas/name = 'John Smith' & $cRes/pID = $cPas/ssnID
		return <reservations>
					{
						<no_reservations>count($cRes/pID)</no_reservations>
					}
				</reservation>
	}
<countRes>

(:query 6:)
<allDestin>
	{
		for $pasID in doc("travel.xml")//travel/passenger
		for $resPID in doc("travel.xml")//travel/reservation
		for $flyID in doc("travel.xml")//travel/flight
		for $airID in doc("travel.xml")//travel/airport
		where $pasID/name = 'John Smith' & $pasID/ssnID = $resPID/pID & $resPID/pID = $flyID/f_id & $airID/a_id = $flyID/fliesTo
		return <flight>
					{
						$airID/name
					}
				</flight>
	}
</allDestin>















