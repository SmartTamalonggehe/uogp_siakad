<?php

namespace App\Events;

use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Queue\SerializesModels;

class ChatEvent
{
    use InteractsWithSockets, SerializesModels;

    public $message;
    public $jadwalId;
    public $dosenId;
    public $mhsId;

    public function __construct($message, $jadwalId, $dosenId, $mhsId)
    {
        $this->message = $message;
        $this->jadwalId = $jadwalId;
        $this->dosenId = $dosenId;
        $this->mhsId = $mhsId;
    }

    public function broadcastOn()
    {
        return new Channel('chat.' . $this->jadwalId);
    }
}
