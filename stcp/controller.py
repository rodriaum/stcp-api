from fastapi import FastAPI, HTTPException
from typing import List, Dict, Union
from stcp.api import (
    get_lines,
    get_line_directions,
    get_line_stops,
    get_stop_data,
    get_stop_real_times
)

def create_app() -> FastAPI:
    app = FastAPI(
        title="STCP API",
        description="""
        API for accessing Porto's public transportation (STCP) data.
        
        ## Features
        * List all bus lines
        * Get line directions
        * Get line stops
        * Get stop information
        * Get real-time bus arrivals
        """,
        version="1.0.0",
        docs_url="/docs",
        redoc_url="/redoc",
        openapi_url="/openapi.json"
    )

    @app.get(
        "/lines",
        summary="List all lines",
        description="Returns a list of all STCP bus lines with their codes and descriptions.",
        response_description="List of lines with code, accessibility and description"
    )
    def get_all_lines():
        """
        Returns all STCP bus lines.
        
        Returns:
            List[Dict]: List of lines with:
                - line_code: Line code
                - accessibility: Accessibility level (0, 1, 2)
                - description: Line description
        """
        try:
            return get_lines()
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))

    @app.get(
        "/lines/{line_code}/directions",
        summary="Get line directions",
        description="Returns the available directions for a specific line.",
        response_description="List of directions with code and description"
    )
    def get_line_directions_endpoint(line_code: str):
        """
        Returns the directions of a specific line.
        
        Args:
            line_code: Line code
            
        Returns:
            List[Dict]: List of directions with:
                - direction_code: Direction code
                - description: Direction description
                - readable: Human-readable direction description
        """
        try:
            return get_line_directions(line_code)
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))

    @app.get(
        "/lines/{line_code}/directions/{direction_code}/stops",
        summary="Get line stops",
        description="Returns all stops for a specific line and direction.",
        response_description="List of stops with code, name and address"
    )
    def get_line_stops_endpoint(line_code: str, direction_code: str):
        """
        Returns the stops of a line in a specific direction.
        
        Args:
            line_code: Line code
            direction_code: Direction code
            
        Returns:
            List[Dict]: List of stops with:
                - stop_code: Stop code
                - name: Stop name
                - zone: Stop zone
                - address: Stop address
                - seq: Stop sequence in the line
        """
        try:
            return get_line_stops(line_code, direction_code)
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))

    @app.get(
        "/stops/{stop_code}",
        summary="Get stop information",
        description="Returns detailed information about a specific stop, including the lines that pass through it.",
        response_description="Detailed stop information"
    )
    def get_stop_info(stop_code: str):
        """
        Returns detailed information about a stop.
        
        Args:
            stop_code: Stop code
            
        Returns:
            Dict: Stop information with:
                - stop_code: Stop code
                - name: Stop name
                - zone: Stop zone
                - address: Stop address
                - mode: Transport mode
                - lon: Longitude
                - lat: Latitude
                - lines: List of lines passing through the stop
        """
        try:
            return get_stop_data(stop_code)
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))

    @app.get(
        "/stops/{stop_code}/realtime",
        summary="Get real-time arrivals",
        description="Returns real-time bus arrival times for a specific stop.",
        response_description="List of arrivals with times and information"
    )
    def get_stop_realtime(stop_code: str, use_cache: bool = True):
        """
        Returns real-time bus arrival times.
        
        Args:
            stop_code: Stop code
            use_cache: Use cache to avoid duplicate requests
            
        Returns:
            List[Dict]: List of arrivals with times and information
        """
        try:
            return get_stop_real_times(stop_code, use_cache)
        except Exception as e:
            raise HTTPException(status_code=500, detail=str(e))

    @app.get(
        "/health",
        summary="Check API health",
        description="Endpoint to check if the API is working correctly.",
        response_description="API status"
    )
    def health_check():
        """
        Checks if the API is working.
        
        Returns:
            Dict: API status
        """
        return {"status": "healthy"}

    return app