<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Cache\RateLimiter;

class MyThorottleMiddleware
{
    protected $limiter;

    public function __construct(RateLimiter $limiter)
    {
        $this->limiter = $limiter;
    }

    public function handle(Request $request, Closure $next)
    {
        $key = $this->resolveRequestSignature($request);
        $maxAttempts = 15000;
        $decayMinutes = 1;

        if ($this->limiter->tooManyAttempts($key, $maxAttempts, $decayMinutes)) {
            // Debug statements

            return response()->json(['message' => 'Talalu banyak permintaan.'], 429);
        }
        $this->limiter->hit($key, $decayMinutes);

        $response = $next($request);

        $response->headers->set('X-RateLimit-Limit', $maxAttempts);
        $response->headers->set('X-RateLimit-Remaining', $this->limiter->retriesLeft($key, $maxAttempts));

        return $response;
    }

    protected function resolveRequestSignature($request)
    {
        return sha1($request->ip());
    }
}
