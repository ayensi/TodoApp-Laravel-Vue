<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use XHProfRuns_Default;

class XhprofMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle($request, Closure $next)
    {
        // We will only profile requests if the proper flag is set on the query
        // of the request. You may further customize this to be disabled on
        // production releases of your application.
        if ($request->query->get('xhprof') !== 'true') {
            return $next($request);
        }

        xhprof_enable();

        $result = $next($request);

        $xhprofData = xhprof_disable();
        $xhprofRuns = new XHProfRuns_Default('/tmp');

        $runId = $xhprofRuns->save_run($xhprofData, 'xhprof_laravel');

        // We will attach the XHProf run ID as part of the response header.
        // This is a lot better than modifying the actual response body.
        $result->headers->set('X-Xhprof-Run-Id', $runId);

        return $result;
    }

}
