<?php
class ModelAdminMessageAdminMessage extends Model {
	public function addMessage($data) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "admin_messages " . "(id, title, message) VALUES (1, '" . $data['title'] . "', '" . $data['message'] . "')");

	}
	//the function above is unnecessary, I think.
	public function getMessage() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "admin_messages LIMIT 1");
		return $query->rows;
	}
}
?>
