<?php


interface Figure 
{
    public function get_area();
}

class Circle implements Figure
{

    public function __construct($radius)
    {
        $this->pi = 3.14;
        $this->radius = $radius;
    }
    
    public function get_area()
    {
        return $this->pi * $this->radius ^ 2; 
    }
	
}

class Rectangle implements Figure
{
	
    public function __construct($a, $b)
    {
        $this->a = $a;
        $this->b = $b;
    }

    public function get_area()
    {
        return $this->a * $this->b; 
    }
	
}

class Triangle implements Figure
{
	
    public function __construct($a, $b, $c)
    {
        $this->a = $a;
        $this->b = $b;
        $this->c = $c;
    }

    public function get_area()
    {
        $p = ($this->a + $this->b + $this->c)/2;
        return $p * ($p - $this->a) * ($p - $this->b) * ($p - $this->c);
    }
	
}

class Decode
{
	
	public function decod($json)
	{
		$figures_data = json_decode($json, true);
		return $figures_data;
	}
	
}


class Sort
{
	
	public static function get_sort()
	{
		$c = new Decode();
		$n = $c -> decod('[{"type":"circle","radius":6},{"type":"rectangle","a":7,"b":5},{"type":"triangle","a":3,"b":5,"c":5},{"type":"rectangle","a":6,"b":8},{"type":"triangle","a":4,"b":5,"c":6},{"type":"circle","radius":7}]');
		
		foreach($n as $figure_data)
		{
			if($figure_data['type'] == "circle")
			{
				$circle = new Circle($figure_data['radius']);
				$result[] = $circle -> get_area();
			}
			elseif ($figure_data['type'] == "rectangle")
			{
				$rectangle = new Rectangle($figure_data['a'], $figure_data['b']);
				$result[] = $rectangle -> get_area();
			}
			elseif ($figure_data['type'] == "triangle")
			{
				$triangle = new Triangle($figure_data['a'], $figure_data['b'], $figure_data['c']);
				$result[] = $triangle -> get_area();
			}
		}
		rsort($result);
		foreach ($result as $key) 
		{
			echo $key."<br>";
		}

	}
}

$sort = new Sort();
$sort = $sort -> get_sort();
