 <?php

class Card {

	private $_db,
					$_data;
	
	public function __construct() {
		$this->_db = DB::getInstance();
	}

	public function create($fields = array(), $races = array(), $types = array(), $artists = array()) {
		if (!$this->_db->insert('cards', $fields)) {
			throw new Exception('There was a problem creating a card');
		}
		$cardId = $this->db()->last();
		foreach ($races as $item) {
			$this->_db->insert('cards_has_race', array('cards_id' => $cardId, 'race_id' => $item));
		}
		foreach ($types as $item) {
			$this->_db->insert('cards_has_type', array('cards_id' => $cardId, 'type_id' => $item));
		}
		foreach ($artists as $item) {
			$this->_db->insert('cards_has_artist', array('cards_id' => $cardId, 'artist_id' => $item));
		}
		return $cardId;
	}

	public function get($id = null) {
		if ($id) {
			$data = $this->_db->query("SELECT cards.id, cards.name, cards.image, cards.firepower, cards.defence, cards.features_line, cards.command_line1, cards.command_line2, cards.number, cards.flavor, cards.errata, cards.comment, cards.dopotsek, cards.energy, cards.strategy, edition.id AS edition_id, edition.name AS edition, edition.quantity AS quantity, edition.date AS date, rarity.name AS rarity, 
				GROUP_CONCAT(DISTINCT race.name SEPARATOR ', ') as races,
				GROUP_CONCAT(DISTINCT type.name SEPARATOR ', ') as types,
				GROUP_CONCAT(DISTINCT artist.name SEPARATOR ', ') as artists
				FROM cards
				JOIN cards_has_race ON cards_has_race.cards_id = cards.id
				JOIN race ON cards_has_race.race_id = race.id
				JOIN cards_has_type ON cards_has_type.cards_id = cards.id
				JOIN type ON cards_has_type.type_id = type.id
				JOIN cards_has_artist ON cards_has_artist.cards_id = cards.id
				JOIN artist ON cards_has_artist.artist_id = artist.id
				JOIN edition ON edition.id = cards.edition_id
				JOIN rarity ON rarity.id = cards.rarity_id AND cards.id = ? GROUP BY cards.id", array($id));

			if ($data->count()) {
				$this->_data = $data->first();
				return true;
			}
			return false;
		}
	}

	public function getCard($edition = null) {
		if ($id) {
			$data = $this->_db->query("SELECT cards.id, cards.name, cards.image, cards.firepower, cards.defence, cards.features_line, cards.command_line1, cards.command_line2, cards.number, cards.flavor, cards.errata, cards.comment, cards.dopotsek, cards.energy, cards.strategy, edition.id AS edition_id, edition.name AS edition, edition.quantity AS quantity, edition.date AS date, rarity.name AS rarity, 
				GROUP_CONCAT(DISTINCT race.name SEPARATOR ', ') as races,
				GROUP_CONCAT(DISTINCT type.name SEPARATOR ', ') as types,
				GROUP_CONCAT(DISTINCT artist.name SEPARATOR ', ') as artists
				FROM cards
				JOIN cards_has_race ON cards_has_race.cards_id = cards.id
				JOIN race ON cards_has_race.race_id = race.id
				JOIN cards_has_type ON cards_has_type.cards_id = cards.id
				JOIN type ON cards_has_type.type_id = type.id
				JOIN cards_has_artist ON cards_has_artist.cards_id = cards.id
				JOIN artist ON cards_has_artist.artist_id = artist.id
				JOIN edition ON edition.id = cards.edition_id
				JOIN rarity ON rarity.id = cards.rarity_id AND cards.id = ? GROUP BY cards.id", array($id));

			if ($data->count()) {
				$this->_data = $data->first();
				return true;
			}
			return false;
		}
	}





	public function update ($fields = array(), $races = array(), $types = array(), $artists = array(), $id = null) {
		if (!$this->_db->update('cards', $id, $fields)) {
			throw new Exception('There was a problem updating a card');
		}
		$this->_db->delete('cards_has_race', array('cards_id', '=', $id));
		foreach ($races as $item) {
			$this->_db->insert('cards_has_race', array('cards_id' => $id, 'race_id' => $item));
		}
		$this->_db->delete('cards_has_type', array('cards_id', '=', $id));
		foreach ($types as $item) {
			$this->_db->insert('cards_has_type', array('cards_id' => $id, 'type_id' => $item));
		}
		$this->_db->delete('cards_has_artist', array('cards_id', '=', $id));
		foreach ($artists as $item) {
			$this->_db->insert('cards_has_artist', array('cards_id' => $id, 'artist_id' => $item));
		}
	}

	public function delete ($id = null) {
		if ($id) {
			$this->_db->delete('cards_has_race', array('cards_id', '=', $id));
			$this->_db->delete('cards_has_type', array('cards_id', '=', $id));
			$this->_db->delete('cards_has_artist', array('cards_id', '=', $id));
			$this->_db->delete('cards', array('id', '=', $id));
		}
	}

	public function showList ($table, $value = null) {
		$data = $this->_db->query("SELECT * FROM $table ORDER BY name");
		$data = $data->results();
		if (!is_array($value)) {
			$value = explode(", ", $value);
		}
		foreach ($data as $item) {
			if (in_array($item->name, $value) || in_array($item->id, $value)) {
				echo "<option selected value=" . $item->id . ">" . $item->name . "</option>";
			} else {
				echo "<option value=" . $item->id . ">" . $item->name . "</option>";
			}			
		}
	}

	public function getAllCards($sort) {
		$data = $this->_db->query("SELECT cards.id, cards.name, cards.number, edition.name AS edition FROM cards, edition WHERE edition.id = cards.edition_id ORDER BY $sort");

		if($data->count()) {
				$this->_data = $data->results();
				return true;
		}
		return false;
	}

	public function getEdition($edition_id = null) {
		if ($edition_id) {
			$data = $this->_db->query("SELECT cards.id, cards.name, cards.image, cards.firepower, cards.defence, cards.features_line, cards.command_line1, cards.command_line2, cards.number, cards.flavor, cards.errata, cards.comment, cards.dopotsek, cards.energy, cards.strategy, edition.name AS edition, edition.quantity AS quantity, edition.date AS date, rarity.name AS rarity, 
				GROUP_CONCAT(DISTINCT race.name SEPARATOR ', ') as races,
				GROUP_CONCAT(DISTINCT type.name SEPARATOR ', ') as types,
				GROUP_CONCAT(DISTINCT artist.name SEPARATOR ', ') as artists
				FROM cards
				JOIN cards_has_race ON cards_has_race.cards_id = cards.id
				JOIN race ON cards_has_race.race_id = race.id
				JOIN cards_has_type ON cards_has_type.cards_id = cards.id
				JOIN type ON cards_has_type.type_id = type.id
				JOIN cards_has_artist ON cards_has_artist.cards_id = cards.id
				JOIN artist ON cards_has_artist.artist_id = artist.id
				JOIN edition ON edition.id = cards.edition_id
				JOIN rarity ON rarity.id = cards.rarity_id
				WHERE edition.id = ?
				GROUP BY cards.number", array($edition_id));

			if ($data->count()) {
				$this->_data = $data->results();
				return true;
			}
			return false;
		}
	}

	public function searchName($string = null) {
		if ($string) {
			$string = str_replace(array("'", "\"", "&quot;"), "", $string);
			$string = str_replace(" ", "%", "%" . $string . "%");
			$data = $this->_db->query("SELECT * FROM `cards` WHERE `name` LIKE '$string' ORDER BY name");
			if ($data->count()) {
				$this->_data = $data->results();
				return true;
			}
			return false;
		}
	}

	public function searchType($value = null) {
		$data = $this->_db->get('type', array('name', '=', $value));
		$value = $data->first()->id;
		$data = $this->_db->query("SELECT cards_has_type.cards_id, cards.id, cards.name, cards.image FROM cards_has_type JOIN cards ON cards.id = cards_has_type.cards_id WHERE type_id = ?", array($value));
		if ($data->count()) {
			$this->_data = $data->results();
			return true;
		}
		return false;
	}

	public function search($data = array()) {

		$clauses = array();

		function addClause($field, $value) {
			$string = '(';
			$x = 1;
			foreach ($value as $item) {
				$string .= $field . ' = ' . $item;
				if ($x < count($value)) {
					$string .= ' OR ';
				} else {
					$string .= ')';
				}
				$x++;
			}
			return $string;
		}

		if ($data['race']) { $clauses[] .= addClause('cards_has_race.race_id', $data['race']); }
		if ($data['rarity']) { $clauses[] .= addClause('cards.rarity_id', $data['rarity']); }
		if ($data['type']) { $clauses[] .= addClause('cards_has_type.type_id', $data['type']); }

		if ($data['edition']) { $clauses[] .= 'cards.edition_id = ' . $data['edition']; }
		if ($data['artist']) { $clauses[] .= 'cards_has_artist.artist_id = ' . $data['artist']; }

		if ($data['features_line']) { $clauses[] .= 'cards.features_line LIKE ' . '"' . str_replace(" ", "%", "%" . $data['features_line'] . "%") . '"'; }
		if ($data['command_line']) { $clauses[] .= 'cards.command_line1 LIKE ' . '"' . str_replace(" ", "%", "%" . $data['command_line'] . "%") . '" OR ' . 'cards.command_line2 LIKE ' . '"' . str_replace(" ", "%", "%" . $data['command_line'] . "%") . '"'; }

		if ($data['dopotsek']) { $clauses[] .= 'cards.dopotsek = ' . $data['dopotsek']; }
		if ($data['strategy']) { $clauses[] .= 'cards.strategy >= ' . $data['strategy']; }

		if ($data['crown']) { $clauses[] .= 'cards.features_line LIKE "%crown%"'; }
		if ($data['hand']) { $clauses[] .= 'cards.features_line LIKE "%hand%"'; }
		if ($data['asteroid']) { $clauses[] .= 'cards.features_line LIKE "%asteroid%"'; }

		//echo var_dump($clauses);

		if ($clauses) {
			$where = '';
			$x = 1;
			foreach ($clauses as $item) {
				$where .= $item;
				if ($x < count($clauses)) {
					$where .= ' AND ';
				}
				$x++;
			}
			//echo '<br>where = "' . $where . '"';
		}

		if ($where) {
			$data = $this->_db->query("SELECT cards.id, cards.name, cards.image, cards.firepower, cards.defence, cards.features_line, cards.command_line1, cards.command_line2, cards.number, cards.flavor, cards.comment, cards.dopotsek, cards.energy, cards.strategy, cards.rarity_id AS rarity, cards.edition_id AS edition, 
				GROUP_CONCAT(DISTINCT cards_has_race.race_id  SEPARATOR ', ') AS race,
				GROUP_CONCAT(DISTINCT cards_has_type.type_id  SEPARATOR ', ') AS type,
				GROUP_CONCAT(DISTINCT cards_has_artist.artist_id  SEPARATOR ', ') AS artist
				FROM cards
				JOIN cards_has_race ON cards_has_race.cards_id = cards.id
				JOIN cards_has_type ON cards_has_type.cards_id = cards.id
				JOIN cards_has_artist ON cards_has_artist.cards_id = cards.id
				WHERE " . $where . " GROUP BY cards.id ORDER BY cards.number");

			if ($data->count()) {
				$this->_data = $data->results();
				return true;
			}
			return false;
		}
	}

	public function db() {
		return $this->_db;
	}

	public function data() {
		return $this->_data;
	}
}